require 'rails_helper'

RSpec.describe Recipe do

  it 'attributes' do
    response = File.read("spec/fixtures/recipe_response.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=b309863d&app_key=630fa3d32a523d174d51172ff767285f&q=Thailand&type=public")
      .to_return(status: 200, body: response, headers: {})

    recipe = EdamamFacade.new.recipe("Thailand").first

    expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipe.url).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCLGyarE65mxyTJFcRP4bk%2FbQNNzRyLO%2BFc9JcPJJr5fwIgXaz%2FqLbYRV7MxIUh9Qag2Da8DWj0hfwXmKYePAEFNFgquQUIZhAAGgwxODcwMTcxNTA5ODYiDCXYrA6iWjzfdCoUGyqWBZES%2Bkw8SpYOGbYC%2FZBVRIBHwCL685ShP5QJQmk14vndEf4dpLDVK5kj89LgqNEDhB8138fmRsvNDhhnu6iJ0QkorYnwNbYPbNtY1b%2FQVYXHivfP9jU5glZmJWLJRoy2%2B5IdpTgwiwKPMnUukFC3farx0liL1hyUbKMFonNRDsEcOsLXLjGhSYHFdla4Lja2oO0Nizp%2Bxqx%2BcvnVjAIwOxACVxqTwlpPDFeMv%2Bq7dW1Oio137Ydtrejsu1F1ir2MjlN1SWFd%2Fkk%2Fa5IPAUdhsqnOtV%2BF2efOaNbvMveX6XmxJp9zAqB7Cl6fN9B85gVfgoyKvwaHfhZoy0NuN9EFu0MKm35m264vZgXwp2Ywa3p40BIrBSMWrki5Q9sJEd4%2BbPXZg05%2BbvdPgYTq2OXizy%2Bkfq3%2FnEDGoFXRFyf6Yucbs1d%2B%2BUIjvV6s5K4wMHD1DgP4Igq94FAK8GsgDywUfxboLlXIL1SklbRTm6uuCNxadxeFLFzmmC96FKhN7Xvx56lcH0o2jWqZ8nFrkJVV6KEc%2Bnx2lMGjjGiydz3nMcgSCCxypzcaPI0l2kPQPkAYzG7NFnbSwN%2BgSWFCCxdpdmibQa655cXHy6zIff7xgJf0ozYoyVvaua%2FgK72QBvUulgZFl2OAjyc%2FXkf3ktgujJ0gwG0DoQHlVAsZJ0s7ZfO%2B8eY%2FlSFnYYzPGOGaYxGkS8nvFHO5qOZvL0rs2QfUc9prN0DSILnRL78DUBcacYSWsHYN4dTJlIK6RqyhdbOKKyZxNA0crDhgvoVDC2uuFufioIrvKl0QIpJExj7l3UZz8lNSNpRRoPDUjlWqTr8hpJWbq330hpGCQAWWCzmjDzNKo7J3wOGEl0oHuaURBho2Jb5hPHivMLSWwKYGOrEBwNsQUiukuGDiXxP3ztcUmPQdw8voHaWDO%2BFkUfU8%2Bw7AMLyXJ6eKk7Y0yJDpOJG6BubeY9tcweQS3EoJyADaXILYo%2FQlupEFEMRiv6eTLNGNq3%2FqscjvQg5hjGfs%2BPd5DBp%2Bn3p0DSsg8kv%2BV8Q0oVJ9cjcBeeB3WF6XkEbadoAbY%2FLXd5ARKJWTmF26kSeZcJ2ky3OcsHGdrD42ksOWmUkjePPxtg55ifa36xqdJsf%2F&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230806T215926Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIYL27RWT%2F20230806%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=01f2f3551130ae79fd4e8e7e95cfa02d28576235d31269e5cfe761ad59d6b2fa")
  end
end
