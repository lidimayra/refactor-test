class Webmotors

  def self.makes
    #search the make
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    JSON.parse response.body
  end

  def self.models(make_id)
    #search the models
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    # Make request for Webmotors site
    make = Make.find_by(webmotors_id: make_id)

    response = Net::HTTP.post_form(uri, { marca: make_id })
    JSON.parse response.body
  end

end
