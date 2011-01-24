FIXTURE_PATH = File.join(File.dirname(__FILE__), '..', 'fixtures')

def load_fixture(name)
  File.read File.expand_path(name, FIXTURE_PATH)
end