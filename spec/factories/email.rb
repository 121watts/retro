FactoryGirl.define do
  factory :email, class: OpenStruct do
    # Assumes Griddler.configure.to is :hash (default)
    to [{ full: 'to_user@email.com', email: 'to_user@email.com', token: 'to_user', host: 'email.com', name: nil }]
    from({ token: 'from_user', host: 'email.com', email: 'jeff@jumpstartlab.com', full: 'From User <jeff@jumpstartlab.com>', name: 'From User' })
    subject 'email subject'
    body 'I just have a lot of feels.'
    attachments {[]}
  end
end
