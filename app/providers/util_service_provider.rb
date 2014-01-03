class UtilServiceProvider < Dee::Rails::ServiceProvider
  provide do
    singleton 'util.text_normalizer' do
      Torutsume::Util::TextNormalizer.new
    end
  end
end
