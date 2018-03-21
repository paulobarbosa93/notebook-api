class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def author
    "Jackson Pires"
  end

  def as_json(options={})
    super(
      methods: :author,
      root: true,
      include: { kind: { only: :description } }
    )
  end
end
