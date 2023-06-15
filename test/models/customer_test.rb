require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  setup do
    @customer = Customer.new(name: "Caspian Corp", language: "english", currency: "usd")
    @primary_contact = "caspianlee@caspiancorp.com"
  end

  test "support_level inclusion validation" do
    @customer.in_setup = false
    @customer.support_level = "medium"
    assert_not @customer.valid?
    assert @customer.errors.include?(:support_level)
  end

  test "rating inclusion validation" do
    @customer.in_setup = false
    @customer.rating = "c"
    assert_not @customer.valid?
    assert @customer.errors.include?(:rating)
  end

  test "billing_strategies inclusion validation" do
    @customer.in_setup = false
    @customer.billing_strategy = "bimonthly"
    assert_not @customer.valid?
    assert @customer.errors.include?(:billing_strategy)
  end

  test "billing_providers inclusion validation" do
    @customer.in_setup = false
    @customer.billing_provider = "discover"
    assert_not @customer.valid?
    assert @customer.errors.include?(:billing_provider)
  end

  test "inclusion validations dont run if in setup mode" do
    @customer.in_setup = true
    @customer.primary_contact = @primary_contact
    assert @customer.valid?
    assert_empty @customer.errors
  end

  test "creates a customer version after update" do
    customer = customers(:caspian_corp)
    assert customer.update!(primary_contact: @primary_contact, two_fa_active: true)
    assert_equal CustomerVersion.last.primary_contact, customer.reload.primary_contact
    assert_equal CustomerVersion.last.two_fa_active, customer.reload.two_fa_active
  end

  test "creating a customer does not create a customer version" do
    assert @customer.save!
    assert_equal CustomerVersion.where(customer_id: @customer.reload.id).count, 0
  end

  test "non versioned attributes dont show up on versioned records" do
    customer = customers(:caspian_corp)
    assert customer.update!(
      primary_contact: @primary_contact,
      two_fa_active: true,
      name: "New Caspian Corporation",
      language: "german"
    )

    assert_nil CustomerVersion.last.name
    assert_nil CustomerVersion.last.language
  end
end
