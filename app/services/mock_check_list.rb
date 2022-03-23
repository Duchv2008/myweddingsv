class MockCheckList
  def initialize(wedding)
    @wedding = wedding
  end

  def perform
    checklist_json = []

    Service.where(is_main: true).each do |service|
      case service.name
      when "Photo & Video"
        json = [
          {
            title: "Chụp ảnh, thuê váy ăn hỏi, váy cưới.",
            service_id: service.id,
            wedding_id: @wedding.id
          }
        ]
        checklist_json << json
      when "Transportation"
        json = [
          {
            title: "Thuê xe cho khách mời.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
          {
            title: "Thuê xe rước dâu.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
          {
            title: "Thuê xe đưa đón đón dâu.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
        ]
        checklist_json << json
      when "Ceremony & Music & Show"
        json = [
          {
            title: "Thuê phông bạt, rạp cưới, loa đài.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
        ]
        checklist_json << json

      when "Jewelry"
        json = [
          {
            title: "Chuẩn bị nhẫn cưới.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
        ]
        checklist_json << json
      when "Reception"
        json = [
          {
            title: "Thuê nhà hàng hoặc chuẩn bị cỗ.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
          {
            title: "Chuẩn bị rượu, chè tiếp đãi khách.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
        ]
        checklist_json << json
      when "Decor"
        json = [
          {
            title: "Mua chăn ga, giường tủ, bàn trang điểm ngày cưới.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
          {
            title: "Đồ decor phòng cưới.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
          {
            title: "Mua chăn ga, giường tủ, bàn trang điểm ngày cưới.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
          {
            title: "Đồ decor phòng cưới.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
          {
            title: "Mua chăn ga, giường tủ, bàn trang điểm ngày cưới.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
        ]
        checklist_json << json
      when "Attire & accessories"
        json = [
          {
            title: "Thuê quần áo vest cho chú rể, bố",
            service_id: service.id,
            wedding_id: @wedding.id
          },
          {
            title: "Thuê quần áo (áo dài) cho cô dâu, mẹ",
            service_id: service.id,
            wedding_id: @wedding.id
          },
        ]
        checklist_json << json
      when "Makeup"
        json = [
          {
            title: "Thuê trang điểm ngày cưới.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
        ]
        checklist_json << json
      when "Other"
        json = [
          {
            title: "Đặt thiệp mời.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
          {
            title: "Hỏi người bê tráp.",
            service_id: service.id,
            wedding_id: @wedding.id
          },
        ]
        checklist_json << json
      end
    end
    Checklist.create! checklist_json
  end
end