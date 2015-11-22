def write_response(response, file_path=nil)
  resp = response.present? response : app.response
  file_path   ||= "#{Rails.root}/tmp/response.#{resp.content_type.symbol.to_s}"
  File.open( file_path, 'w' ) { |file| file.write resp.body }
end