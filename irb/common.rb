def yaml_dump(record)
  puts record.attributes.except(*%w(id created_at updated_at)).to_yaml
end

def sign(params, key = "")
  data = params.map{|param| param.strip}.compact.join
  OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('md5'), key, data)
end


