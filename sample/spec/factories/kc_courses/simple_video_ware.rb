FactoryGirl.define do
  factory :simple_video_ware, class: KcCourses::SimpleVideoWare do
    sequence(:name){|n| "视频课件#{n}"}
    sequence(:desc){|n| "视频课件#{n} 描述"}
    chapter
    creator {create(:user)}

    association :file_entity, factory: :video_file_entity
  end
end
