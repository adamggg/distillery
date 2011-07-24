require 'spec_helper'

def distillation_of(filename, &block)

  describe "distillation of #{filename}" do

    let(:fixture) do
      File.read(File.join(File.dirname(__FILE__), 'fixtures', filename))
    end

    subject { Distillery::Document.new(fixture).distill! }

    it 'should include the right elements' do
      instance_eval(&block)
    end
  end
end

distillation_of 'agave_cookies.html' do
  should =~ /AGAVE &amp; HONEY OATMEAL M&amp;M COOKIES/
  should =~ /2 Tbsp lightly beaten egg/
  should =~ /Recipe Source:/

  should_not =~ /I am a HUGE fan of agave and cook/         # Post comment
  should_not =~ /mnuEntertaining/                           # ID of element in header
  should_not =~ /Get Email Updates/                         # Sidebar
  should_not =~ /id="footer"/                               # Footer
end

distillation_of 'clams_and_linguini.html' do
  should =~ /<h2>Linguini with Clam Sauce Recipe<\/h2>/
  should =~ /2 pounds small clams in the shell/
  should =~ /completely evaporated./

  should_not =~ /Licorice sounds interesting./              # Comment
  should_not =~ /Bookmark this page using the following/    # Footer
  should_not =~ /Google Search/                             # Header
end

distillation_of 'beef_jerkey.html' do
  should =~ /always had a weakness/
  should =~ /2 pounds trimmed beef top round/
  should =~ /Om nom nom nom/

  should_not =~ /Leave a Reply/                             # Footer
  should_not =~ /EMAIL SUBSCRIPTION/                        # Sidebar
  should_not =~ /allthingssimpleblog.com\/feed\//           # Header
end

distillation_of 'vanilla_pound_cake.html' do
  should =~ /Tahitian bean for its floral notes/
  should =~ /beat until light and fluffy/
  should =~ /cake comes out clean/

  should_not =~ /Pound cake is a classi/                    # Comments
  should_not =~ /Simple template. Powered by/               # Footer
  should_not =~ /Conversions and Measurement Tips/          # Header
end

distillation_of 'clouds_shining_moment.html' do
  should =~ /The Dueling Models of Cloud Computing/
  should =~ /These kinds of failures don't expose the weaknesses/
  should =~ /Dynamic DNS pointing to elastic load balancers/

  should_not =~ /Razi Sharir/                               # Comments
  should_not =~ /All trademarks and registered/             # Footer
  should_not =~ /Community Guidelines/                      # Header
end

distillation_of 'game_blog.html' do
  should =~ /Currently in my Plants vs Zombies clone/
  should =~ /50% they start to show sign/
  should =~ /can never get enough feedback./

  should_not =~ /Tutorials/                                 # Header
  should_not =~ /Java Project/                              # Sidebar
  should_not =~ /View all comments/                         # Footer
end

distillation_of 'js_this_keyword.html' do
  should =~ /keyword is ubiquitous yet misconceptions abound/
  should =~ /in ECMAScript parlance these are/
  should =~ /Annex C/

  should_not =~ /11 RESPONSES TO UNDERSTANDING/             # Footer
  should_not =~ /The JavaScript Comma Operator/             # Sidebar
  should_not =~ /Auto-generating JavaScript Unit Test/      # Header
end

distillation_of 'nyt_social_media.html' do
  should =~ /What happens if you bring together/
  should =~ /shows a 2D bar-graph-like timeline/
  should =~ /then to explore several links/

  should_not =~ /ADD A COMMENT/                             # Comments
  should_not =~ /ABOUT 1,000 POSTS AGO/                     # Sidebar
  should_not =~ /iPhone Tracker: How your/                  # Header
end

distillation_of 'ginger_cookies.html' do
  should =~ /Ginger cookies are chilled/
  should =~ /12 minutes/
  should =~ /Makes about 4 dozen crispy/

  should_not =~ /Sponsored Links/                             # Sidebar
  should_not =~ /User Reviews/                                # Comments
  should_not =~ /Free Southern Food Newsletter!/              # Header
end

distillation_of 'bourbon_balls.html' do
  should =~ /The Kentucky Derby will be run Saturday/
  should =~ /Just drop one of your bourbon balls into a cup of coffee/
  should =~ /You can also use the ganache as a cake frosting/

  should_not =~ /I just tried the recipe forCellar Doo/       # Comments
  should_not =~ /FIND A STATION/                              # Header
  should_not =~ /Car Talk/                                    # Footer
end

distillation_of 'bulgogi.html' do
  should =~ /early-season barbecue/
  should =~ /Still, it is American to not fuss/
end