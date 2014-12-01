class Feel < ActiveRecord::Base
  belongs_to :user
  validates :emoji, presence: true
  validates :body, presence: true

  def emoji_img
    {
    '0' => 'emoji_0_angry.png',
    '1' => 'emoji_1_proud.png',
    '2' => 'emoji_2_happy.png',
    '3' => 'emoji_3_content.png',
    '4' => 'emoji_4_neutral.png',
    '5' => 'emoji_5_anxious.png',
    '6' => 'emoji_6_worried.png',
    '7' => 'emoji_7_oh_shit.png',
    '8' => 'emoji_8_sad.png',
    '9' => 'emoji_9_surprised.png'
    }
  end

end
