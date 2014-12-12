require "random_api"

def stub_user_return
  {
    "user" => {
      "gender" => "female",
      "name" => {
        "title" => "ms",
        "first" => "lois",
        "last" => "williams"
      },
      "location" => {
        "street" => "1969 elgin st",
        "city" => "frederick",
        "state" => "delaware",
        "zip" => "56298"
      },
      "email" => "lois.williams50@example.com",
      "username" => "heavybutterfly920",
      "password" => "enterprise",
      "salt" => ">egEn6YsO",
      "md5" => "2dd1894ea9d19bf5479992da95713a3a",
      "sha1" => "ba230bc400723f470b68e9609ab7d0e6cf123b59",
      "sha256" => "f4f52bf8c5ad7fc759d1d4156b25a4c7b3d1e2eec6c92d80e508aa0b7946d4ba",
      "registered" => "1288182167",
      "dob" => "146582153",
      "phone" => "(555)-942-1322",
      "cell" => "(178)-341-1520",
      "SSN" => "137-37-8866",
      "picture" => {
        "large" => "http://api.randomuser.me/portraits/women/55.jpg",
        "medium" => "http://api.randomuser.me/portraits/med/women/55.jpg",
        "thumbnail" => "http://api.randomuser.me/portraits/thumb/women/55.jpg",
      },
      "version" => "0.4.1"
    },
    "seed" => "graywolf"
  }
end