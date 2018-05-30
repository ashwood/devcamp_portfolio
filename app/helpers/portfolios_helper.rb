module PortfoliosHelper
  def image_generator(height:, width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end

  def portfolio_img img, type
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(height: '260', width: '320')
    else type == 'main'
      image_generator(height: '565', width: '387')
    end
  end

end
