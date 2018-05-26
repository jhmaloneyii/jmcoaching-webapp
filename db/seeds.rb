# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lorum_content = "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum laoreet efficitur scelerisque. Suspendisse fermentum nibh sit amet lorem fermentum, in facilisis quam consectetur. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris eu diam pulvinar, fermentum ligula sit amet, ultricies quam. Phasellus consequat urna vel erat hendrerit auctor. Vestibulum faucibus cursus velit non tincidunt. Morbi faucibus vulputate tortor at ornare. Mauris dapibus ante eget sem malesuada porta. Etiam tincidunt neque vitae tristique sollicitudin. Vestibulum faucibus est at odio imperdiet vulputate. Integer varius eros orci, eu vulputate tortor rutrum sit amet. Quisque non diam lacinia, auctor sem eu, congue ipsum. Integer at elit nec ipsum consequat pulvinar. Nulla blandit mattis massa, sed vehicula justo gravida in.

Aliquam imperdiet consequat eros, at finibus elit malesuada sed. Phasellus consequat odio in felis efficitur venenatis. Phasellus quis turpis eu lorem faucibus euismod pretium nec ligula. Proin a rhoncus elit. Donec feugiat enim et aliquam vestibulum. Praesent aliquet dignissim nisl, ut fringilla erat aliquam sed. Donec tempus dui in neque pulvinar ornare. Ut dignissim dapibus eros eu mattis. Nam id lacus vel tellus egestas pellentesque. Cras sit amet tincidunt nibh, id pellentesque sapien. Nulla eu varius nunc.

Vestibulum ex velit, varius vehicula massa in, elementum consequat massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis scelerisque risus tortor. Nam eget vulputate augue. Aenean vulputate maximus orci, vitae pellentesque erat iaculis eu. Suspendisse sodales metus magna, sit amet sodales nisl aliquam non. Morbi at neque ultricies, condimentum erat a, congue risus. Suspendisse potenti. Nam porttitor sodales tortor vel tempor. In quis sem eget nisi ornare hendrerit quis at nibh. Morbi sed dictum lectus. Nam in tincidunt quam. Proin nec euismod libero. Morbi massa tortor, suscipit id tempus id, scelerisque non felis. Suspendisse non erat quam. Nullam et eros nec eros pulvinar blandit.

Phasellus lectus magna, bibendum a justo sit amet, vehicula dictum urna. Proin ante sem, tempus nec magna ac, vulputate blandit tellus. Pellentesque at aliquam risus, a sodales velit. Fusce nibh ex, lobortis in leo vel, molestie accumsan eros. Etiam tincidunt nisi ut turpis lobortis viverra. Nullam sit amet ullamcorper turpis, et fringilla mi. Mauris nec leo et ex dictum ornare. Maecenas eu facilisis purus, vitae hendrerit leo. Duis sed turpis a tellus sodales interdum. Duis porttitor ante vitae nisi molestie tincidunt. Fusce nisl ligula, blandit vitae arcu vel, convallis tincidunt neque. Praesent consequat quis libero nec facilisis. Nullam rutrum lacinia purus, in interdum odio tempus et. Integer a rutrum libero. Suspendisse non tortor ac enim molestie ullamcorper vitae eu sapien. Curabitur lorem est, convallis a orci sit amet, varius ultrices lorem.

Nam suscipit gravida sapien, nec ullamcorper quam laoreet porta. Praesent efficitur, sem id maximus tristique, dolor ligula ornare sapien, vel pretium nulla tortor in arcu. Nunc ut consectetur sem. Vestibulum ultricies volutpat orci. Phasellus laoreet velit nunc, sed scelerisque tellus elementum non. Sed aliquam interdum nulla, non iaculis quam. Ut laoreet tellus id euismod laoreet. Donec ex velit, volutpat eu urna sit amet, porta rutrum lectus. Nam eget lacus urna. Donec pulvinar, diam sed finibus rhoncus, ante nunc feugiat nulla, et luctus orci lorem vitae leo. Vivamus sed lacinia lectus, non blandit purus. Morbi non vestibulum sem, ac commodo sem. Aliquam et erat nibh. Sed facilisis nisi velit, nec eleifend quam consectetur ac. Vestibulum eget nisl pellentesque, porta libero non, luctus lorem."

lorum_summary = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus justo id lectus eleifend, at faucibus ante maximus. Aliquam erat volutpat nullam.</p>"

100.times do |x|
  Post.where(title: "Seed Blog Post #{x}" , content: lorum_content , summary: lorum_summary , active: [true, false].sample , image: "/public/uploads/post/image/11/20247970_1369093783139568_8066523405226481860_o.jpg").first_or_create
end

Admin.create(username: "jmcoaching", email: "jmcoachingllc@gmail.com", encrypted_password: Devise::Encryptor.digest(Admin, 'password'))
