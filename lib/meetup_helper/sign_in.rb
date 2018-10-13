class MeetupHelper::SignIn
  
  def initialize
    @@agent = Mechanize.new
  end

  def sign_in
    page = @@agent.get('https://secure.meetup.com/login/')
    sign_in = page.forms[1]
    puts "Sign in to Meetup.com"
    puts "Email: "
    sign_in.email = gets.chomp
    puts "Password: "
    sign_in.password = STDIN.noecho(&:gets).chomp
    @page = @@agent.submit(sign_in)
  end

  def self.agent
    @@agent
  end

end