require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    skip
    mail = OrderMailer.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["ant-ady@mail.ru"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    skip
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["ant-ady@mail.ru"], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
