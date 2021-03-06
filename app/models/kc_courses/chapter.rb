module KcCourses
  class Chapter
    include Mongoid::Document
    include Mongoid::Timestamps
    include KcCourses::Concerns::MovePosition
    include KcCourses::Concerns::ChapterReadingMethods

    field :name, :type => String
    field :desc, :type => String

    belongs_to :course, class_name: 'KcCourses::Course'
    belongs_to :creator, class_name: 'User'

    validates :name, :presence => true
    validates :course,  :presence => true
    validates :creator, presence: true

    has_many :wares, class_name: 'KcCourses::Ware'
    #has_many :questions
    #has_many :practices

    # 重写MovePosition
    def parent
      course
    end

    before_validation :set_default_value
    def set_default_value
      self.name = "无标题章节 - #{Time.now}" if self.name.blank?
    end

  end
end
