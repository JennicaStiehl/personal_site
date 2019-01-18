#https://warm-fortress-64019.herokuapp.com/
require 'rack'

class PersonalSite
  def self.call(env)
    case env["PATH_INFO"]
    when '/' then index
    when '/about' then about
    when '/main.css' then css
    when '/blog' then blog
    else
      error
    end
  end

  def self.index
    render_view('index.html')
  end

  def self.about
    render_view('about.html')
  end

  def self.error
    render_view('error.html', '404')
  end

  def self.render_view(page, code = '200')
    [code, {'Content-Type' => 'text/html'}, [File.read("./app/views/#{page}")]]
    # Recall, this array includes the HTTP response status code, HTTP response headers & HTTP body
  end

  def self.css
    render_static('main.css')
  end

  def self.render_static(asset)
    [200, {'Content-Type' => 'test/html'}, [File.read("./public/#{asset}")]]
  end
end
