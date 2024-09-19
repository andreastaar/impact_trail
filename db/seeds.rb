require "open-uri"

puts "eliminando datos"
Application.destroy_all
Review.destroy_all
Offer.destroy_all
User.destroy_all

puts "Crear usuarios"
usuarios = User.create!(
  [
    # organizacion
    { email: 'alberto.martinez@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      first_name: 'Alberto',
      last_name: 'Martínez',
      role: 'organización',
      location: 'Perú',
      instagram_account: 'alberto_martinez',
      facebook_account: 'alberto_martinez_fb',
      organization_name: 'Fundación Esperanza',
      organization_address: 'Av. Joaquin de la Madrid 200, Lima 15037',
      description: 'Organización dedicada a ayudar a comunidades marginadas.' },
    { email: 'sofia.ramirez@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      first_name: 'Sofía',
      last_name: 'Ramírez',
      role: 'organización',
      location: 'Colombia',
      instagram_account: 'sofia_ramirez',
      facebook_account: 'sofia_ramirez_fb',
      organization_name: 'Red de Apoyo Social',
      organization_address: 'Kr 13 #8525, Bogotá, Colombia',
      description: 'Promueve el bienestar social y la inclusión.' },
    { email: 'organizacion@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      first_name: 'Emilio',
      last_name: 'Cerna',
      role: 'organización',
      location: 'Argentina',
      instagram_account: 'emiliocerna',
      facebook_account: 'emilio_cerna_fb',
      organization_name: 'Voluntarios para la paz',
      organization_address: 'Belgrano 1800, Buenos Aires',
      description: 'Promueve el bienestar social y la inclusión.' },
      # voluntario
    { email: 'voluntario@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      first_name: 'Lucas',
      last_name: 'González',
      role: 'voluntario',
      location: 'Chile',
      city_name: 'Santiago de Chile',
      instagram_account: 'lucas_gonzalez',
      facebook_account: 'lucas_gonzalez_fb',
      organization_name: nil,
      description: 'Apasionado por el voluntariado y la ayuda comunitaria.' },
    { email: 'carla.morales@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      first_name: 'Carla',
      last_name: 'Morales',
      role: 'voluntario',
      location: 'Italia',
      city_name: 'Roma',
      instagram_account: 'carla_morales',
      facebook_account: 'carla_morales_fb',
      organization_name: nil,
      description: 'Interesada en contribuir a causas sociales.' },
    { email: 'julio.perez@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      first_name: 'Julio',
      last_name: 'Perez',
      role: 'voluntario',
      location: 'Mexico',
      city_name: 'Ciudad de Mexico',
      instagram_account: 'julioperez',
      facebook_account: 'julio_p_fb',
      organization_name: nil,
      description: 'Interesado en conocer más gente con este estilo de vida colaborador.' }
  ]
)

puts "creando imagenes"
user_images = [
  "https://s3-us-west-2.amazonaws.com/anchor-generated-image-bank/production/podcast_uploaded400/9796984/9796984-1613805696689-ac884b986ad7c.jpg",
  "https://img.freepik.com/vector-gratis/plantilla-diseno-logotipo-amor-mano_474888-2344.jpg",
  "https://yfu.org.ec/wp-content/uploads/2018/04/YFU_Icons_volunteers_rgb.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/ChrisEvans2023.jpg/440px-ChrisEvans2023.jpg",
  "https://exitofem.com/wp-content/uploads/2020/04/Imagen-Destacada.jpg",
  "https://www.clarin.com/img/2024/07/04/uteodLeuh_2000x1500__1.jpg"
]

user_images.each_with_index do |imagen, index|
  file = URI.parse(imagen).open
  usuario = usuarios[index]
  usuario.photo.attach(io: file, filename: "#{usuario.email}.jpg ", content_type: "image/jpg")
end

puts "creando ofertas"
ofertas = Offer.create!(
  [
    # Ofertas para organization 1
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
      country_name: 'Mexico', # nuevo
      latitude: 19.4326,
      longitude: -99.1332,
      perks: '[2 días libres|Habitación privada|Desayuno]', # nuevo
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
      country_name: 'Mexico', # nuevo
      latitude: 19.4326,
      longitude: -99.1332,
      perks: '[2 días libres|Habitación compartida|Cena]', # nuevo
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
      address: 'Calle 5 de Febrero 456, Ciudad de México',
      city: 'Ciudad de Mexico',
      country_name: 'Mexico', # nuevo
      perks: '[1 día libre|Habitación privada|Almuerzo]', # nuevo
      type_of_volunteering: 'Proyectos de construcción y restauración' # Nuevo campo agregado
    },
    {
      title: 'Apoyo en Centro de Día para Adultos Mayores',
      description: 'Asistir en actividades y cuidados de adultos mayores.',
      requirements: 'Empatía y habilidades para el cuidado.',
      start_date: '2024-10-02',
      end_date: '2024-12-31',
      availability: 4,
      user: usuarios[1],
      address: 'Calle 72 #23, Bogota',
      city: 'Bogota',
      country_name: 'Colombia', # nuevo
      latitude: 4.7110,
      longitude: -74.0721,
      perks: '[1 día libre|Habitación privada|Almuerzo]', # nuevo
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
      address: 'Carrera 13 #45-67, Bogota',
      city: 'Bogota',
      country_name: 'Colombia', # nuevo
      latitude: 4.7110,
      longitude: -74.0721,
      perks: '[1 día libre|Habitación privada|Almuerzo]', # nuevo
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
      address: 'Carrera 13 #45-67, Bogota',
      city: 'Bogota',
      country_name: 'Colombia', # nuevo
      latitude: 4.7110,
      longitude: -74.0721,
      perks: '[1 día libre|Habitación privada|Almuerzo]', # nuevo
      type_of_volunteering: 'Proyectos de construcción y restauración' # Nuevo campo agregado
    }
  ]
)

puts "creando imagenes"
# offer_images = [
#   "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg/800px-MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg",
#   "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg/800px-MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg",
#   "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg/800px-MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg",
#   "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg/800px-MJK_08789_Robert_Pattinson_%28Damsel%2C_Berlinale_2018%29_%28cropped%29.jpg",
# ]

# # Adjuntar imágenes a las ofertas
# offer_images.each_with_index do |imagen, index|
#   file = URI.parse(imagen).open
#   oferta = ofertas[index]
#   oferta.photos.attach(io: file, filename: "#{oferta.title.parameterize}.jpg", content_type: "image/jpg")
# end

# Crear aplicaciones para los voluntarios
aplicaciones = Application.create!(
  [
    { offer: ofertas[0], user: usuarios[3], status: 'INICIADO', start_date: '2024-10-10', end_date: '2024-10-25' },
    { offer: ofertas[1], user: usuarios[3], status: 'ACEPTADO', start_date: '2024-10-10', end_date: '2024-10-25' },
    { offer: ofertas[2], user: usuarios[4], status: 'INICIADO', start_date: '2024-10-11', end_date: '2024-10-20' },
    { offer: ofertas[3], user: usuarios[4], status: 'ACEPTADO', start_date: '2024-10-11', end_date: '2024-10-20' },
    { offer: ofertas[4], user: usuarios[5], status: 'INICIADO', start_date: '2024-10-15', end_date: '2024-10-30' },
    { offer: ofertas[5], user: usuarios[5], status: 'ACEPTADO', start_date: '2024-10-15', end_date: '2024-10-30' }
  ]
)

# Crear reseñas para las ofertas asociadas a las aplicaciones
resenas = Review.create!(
  [
    { rating: 5.0, content: 'Una experiencia muy enriquecedora. ¡Altamente recomendado!', user: usuarios[3], organization_id: usuarios[0].id },
    { rating: 4.0, content: 'Excelente organización y muy bien gestionado.', user: usuarios[3], organization_id: usuarios[0].id },
    { rating: 5.0, content: 'Buena experiencia, aunque podría haber más actividades.', user: usuarios[4], organization_id: usuarios[1].id },
    { rating: 5.0, content: 'La organización fue muy profesional y me brindaron el apoyo necesario para adaptarme al entorno local.', user: usuarios[4], organization_id: usuarios[1].id }, #nuevo
    { rating: 4.0, content: 'Los anfitriones fueron muy acogedores y me enseñaron valiosas lecciones sobre cómo llevar una vida más autosuficiente y respetuosa con el medio ambiente.', user: usuarios[5], organization_id: usuarios[2].id }, #nuevo
    { rating: 5.0, content: 'Muy bien organizado y un equipo muy acogedor.', user: usuarios[5], organization_id: usuarios[2].id }
  ]
)
