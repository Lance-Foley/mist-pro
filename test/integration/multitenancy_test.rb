require 'test_helper'

class Jumpstart::MultitenancyTest< ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @account = accounts(:company)
    sign_in @user
  end

  if Jumpstart::Multitenancy.domain?
    test "domain multitenancy" do
      get root_path
      assert_match "Signed in as <strong>#{@user.name}</strong>", response.body

      host! @account.domain
      sign_in @user

      get root_path
      assert_match "Signed in as <strong>#{@account.name}</strong>", response.body
    end
  end

  if Jumpstart::Multitenancy.domain?
    test "subdomain multitenancy" do
      get root_path
      assert_match "Signed in as <strong>#{@user.name}</strong>", response.body

      host! "#{@account.subdomain}.example.com"
      sign_in @user

      get root_path
      assert_match "Signed in as <strong>#{@account.name}</strong>", response.body
    end
  end

  if Jumpstart::Multitenancy.path?
    test "script path multitenancy" do
      get "/"
      assert_match "Signed in as <strong>#{@user.name}</strong>", response.body

      get "/#{@account.id}/"
      assert_match "Signed in as <strong>#{@account.name}</strong>", response.body
    end
  end

  if Jumpstart::Multitenancy.session?
    test "session multitenancy" do
      get root_path
      assert_match "Signed in as <strong>#{@user.name}</strong>", response.body

      switch_account(@account)

      get root_path
      assert_match "Signed in as <strong>#{@account.name}</strong>", response.body
    end
  end
end

