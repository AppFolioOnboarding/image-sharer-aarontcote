# Image seeding
image_attributes = [
  { url: 'https://images.unsplash.com/photo-1565207192414-5ba80622abb8' },
  { url: 'https://images.unsplash.com/photo-1562613531-a131faf45335' },
  { url: 'https://images.unsplash.com/photo-1593959554825-e14b11e69227' },
  { url: 'https://images.unsplash.com/photo-1533526575942-31f7bcec6753' },
  { url: 'https://images.unsplash.com/photo-1561149877-84d268ba65b8' },
  { url: 'https://images.unsplash.com/photo-1579445710183-f9a816f5da05' },
  { url: 'https://images.unsplash.com/photo-1501432377862-3d0432b87a14' },
  { url: 'https://images.unsplash.com/photo-1569003339405-ea396a5a8a90' },
  { url: 'https://images.unsplash.com/photo-1534375971785-5c1826f739d8' },
  { url: 'https://images.unsplash.com/photo-1529335764857-3f1164d1cb24' },
  { url: 'https://images.unsplash.com/photo-1560932684-5e552e2894e9' },
  { url: 'https://images.unsplash.com/photo-1552998841-3a61a27d4173' },
  { url: 'https://images.unsplash.com/photo-1568833450751-fba3c6b2d129' },
  { url: 'https://images.unsplash.com/photo-1571781565036-d3f759be73e4' },
  { url: 'https://images.unsplash.com/photo-1580164631075-b3f1304f4051' },
  { url: 'https://images.unsplash.com/photo-1557342960-7ea3df1d8630' },
  { url: 'https://images.unsplash.com/photo-1547130542-00f463cf8c0c' },
  { url: 'https://images.unsplash.com/photo-1559535332-db9971090158' },
  { url: 'https://images.unsplash.com/photo-1613276017067-ef618366152a' },
  { url: 'https://images.unsplash.com/photo-1593783162886-d2277f7d5908' }
]

image_attributes.each do |attributes|
  Image.create!(attributes)
end
