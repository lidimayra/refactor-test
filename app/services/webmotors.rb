class Webmotors

  def self.makes
    request('marcas')
  end

  def self.models(make_id)
    request('modelos', { marca: make_id })
  end


  private_class_method def self.request(segment, **options)
    uri = URI("http://www.webmotors.com.br/carro/#{segment}")
    response = Net::HTTP.post_form(uri, options)
    JSON.parse response.body
  end

end
