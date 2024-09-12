require "open-uri"

puts "eliminando datos"
Application.destroy_all
Review.destroy_all
Offer.destroy_all
User.destroy_all

puts "Crear usuarios"
usuarios = User.create!(
  [
    { email: 'alberto.martinez@example.com', password: '123456', password_confirmation: '123456', first_name: 'Alberto', last_name: 'Martínez', role: 'organización', location: 'México', instagram_account: 'alberto_martinez', facebook_account: 'alberto_martinez_fb', organization_name: 'Fundación Esperanza', description: 'Organización dedicada a ayudar a comunidades marginadas.' },
    { email: 'sofia.ramirez@example.com', password: '123456', password_confirmation: '123456', first_name: 'Sofía', last_name: 'Ramírez', role: 'organización', location: 'Colombia', instagram_account: 'sofia_ramirez', facebook_account: 'sofia_ramirez_fb', organization_name: 'Red de Apoyo Social', description: 'Promueve el bienestar social y la inclusión.' },
    { email: 'lucas.gonzalez@example.com', password: '123456', password_confirmation: '123456', first_name: 'Lucas', last_name: 'González', role: 'voluntario', location: 'Argentina', instagram_account: 'lucas_gonzalez', facebook_account: 'lucas_gonzalez_fb', organization_name: nil, description: 'Apasionado por el voluntariado y la ayuda comunitaria.' },
    { email: 'carla.morales@example.com', password: '123456', password_confirmation: '123456', first_name: 'Carla', last_name: 'Morales', role: 'voluntario', location: 'Chile', instagram_account: 'carla_morales', facebook_account: 'carla_morales_fb', organization_name: nil, description: 'Interesada en contribuir a causas sociales.' }
  ]
)

puts "creando imagenes"
user_images = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg/800px-MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg",
  "https://m.media-amazon.com/images/M/MV5BMTM3OTUwMDYwNl5BMl5BanBnXkFtZTcwNTUyNzc3Nw@@._V1_.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/ChrisEvans2023.jpg/440px-ChrisEvans2023.jpg",
  "https://exitofem.com/wp-content/uploads/2020/04/Imagen-Destacada.jpg",
]

user_images.each_with_index do |imagen, index|
  file = URI.parse(imagen).open
  usuario = usuarios[index]
  usuario.photo.attach(io: file, filename: "#{usuario.email}.jpg ", content_type: "image/jpg")
end

puts "creando ofertas"
ofertas = Offer.create!(
  [
    # Ofertas para Alberto Martínez
    {
      title: 'Voluntariado en Educación Infantil',
      description: 'Apoyar en la educación de niños en situación de vulnerabilidad.',
      requirements: 'Paciencia y habilidades educativas.',
      start_date: '2024-10-01',
      end_date: '2024-12-31',
      availability: 4,
      user: usuarios[0],
      address: 'Av. Reforma 123, Ciudad de México',
      city: 'Ciudad de Mexico',
      latitude: 19.4326,
      longitude: -99.1332,
      type_of_volunteering: 'Enseñanza e idiomas' # Nuevo campo agregado
    },
    {
      title: 'Asistencia en Refugio para Personas Sin Hogar',
      description: 'Ayudar en la gestión y asistencia en el refugio.',
      requirements: 'Experiencia en trabajo social es deseable.',
      start_date: '2024-10-05',
      end_date: '2024-12-30',
      availability: 5,
      user: usuarios[0],
      address: 'Calle 5 de Febrero 456, Ciudad de México',
      city: 'Ciudad de Mexico',
      latitude: 19.4326,
      longitude: -99.1332,
      type_of_volunteering: 'Mejora de la comunidad' # Nuevo campo agregado
    },
    {
      title: 'Campaña de Recaudación de Fondos',
      description: 'Organizar eventos para recaudar fondos para la organización.',
      requirements: 'Experiencia en eventos o marketing.',
      start_date: '2024-10-10',
      end_date: '2024-12-15',
      availability: 3,
      user: usuarios[0],
      address: 'Plaza Central 789, Ciudad de México',
      city: 'Ciudad de Mexico',
      latitude: 19.4326,
      longitude: -99.1332,
      type_of_volunteering: 'Proyectos de construcción y restauración' # Nuevo campo agregado
    },

    # Ofertas para Sofía Ramírez
    {
      title: 'Apoyo en Centro de Día para Adultos Mayores',
      description: 'Asistir en actividades y cuidados de adultos mayores.',
      requirements: 'Empatía y habilidades para el cuidado.',
      start_date: '2024-10-02',
      end_date: '2024-12-31',
      availability: 4,
      user: usuarios[1],
      address: 'Calle 72 #23, Bogotá',
      city: 'Bogotá',
      latitude: 4.7110,
      longitude: -74.0721,
      type_of_volunteering: 'Mejora de la comunidad' # Nuevo campo agregado
    },
    {
      title: 'Talleres de Capacitación para Jóvenes',
      description: 'Conducir talleres para el desarrollo de habilidades en jóvenes.',
      requirements: 'Habilidades en educación y liderazgo.',
      start_date: '2024-10-07',
      end_date: '2024-12-20',
      availability: 4,
      user: usuarios[1],
      address: 'Carrera 13 #45-67, Bogotá',
      city: 'Bogotá',
      latitude: 4.7110,
      longitude: -74.0721,
      type_of_volunteering: 'Enseñanza e idiomas' # Nuevo campo agregado
    },
    {
      title: 'Voluntariado en Centro de Rehabilitación',
      description: 'Apoyar en la rehabilitación de personas con adicciones.',
      requirements: 'Experiencia en psicología o trabajo social.',
      start_date: '2024-10-15',
      end_date: '2024-12-15',
      availability: 3,
      user: usuarios[1],
      address: 'Avenida 15 #78-90',
      city: 'Bogotá',
      latitude: 4.7110,
      longitude: -74.0721,
      type_of_volunteering: 'Proyectos de construcción y restauración' # Nuevo campo agregado
    }
  ]
)

puts "creando imagenes"
offer_images = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg/800px-MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg/800px-MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg/800px-MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg/800px-MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg",
]

# Adjuntar imágenes a las ofertas
offer_images.each_with_index do |imagen, index|
  file = URI.parse(imagen).open
  oferta = ofertas[index]
  oferta.photos.attach(io: file, filename: "#{oferta.title.parameterize}.jpg", content_type: "image/jpg")
end

# Crear aplicaciones para los voluntarios
aplicaciones = Application.create!(
  [
    { offer: ofertas[0], user: usuarios[2], status: 'INICIADO' },
    { offer: ofertas[1], user: usuarios[2], status: 'ACEPTADO' },
    { offer: ofertas[3], user: usuarios[3], status: 'INICIADO' },
    { offer: ofertas[4], user: usuarios[3], status: 'ACEPTADO' }
  ]
)

# Crear reseñas para las ofertas asociadas a las aplicaciones
resenas = Review.create!(
  [
    { rating: 5.0, content: 'Una experiencia muy enriquecedora. ¡Altamente recomendado!', user: usuarios[2], organization_id: usuarios[0].id },
    { rating: 4.5, content: 'Excelente organización y muy bien gestionado.', user: usuarios[2], organization_id: usuarios[0].id },
    { rating: 4.0, content: 'Buena experiencia, aunque podría haber más actividades.', user: usuarios[3], organization_id: usuarios[1].id },
    { rating: 4.5, content: 'Muy bien organizado y un equipo muy acogedor.', user: usuarios[3], organization_id: usuarios[1].id }
  ]
)
