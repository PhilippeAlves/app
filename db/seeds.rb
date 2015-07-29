puts "inserindo instituição..."
Institution.create(name: 'Instituição exemplo', description: 'Descrição da instituição exemplo')

puts "inserindo departamentos..."
Department.create(institution_id: 1, name: 'Segurança', description: 'Responsável pela segurança da instituição')
Department.create(institution_id: 1, name: 'Limpeza', description: 'Responsável pela limpeza da instituição')
Department.create(institution_id: 1, name: 'TI', description: 'Responsável pelo suprte e manutenção de equipamentos da instituição')

puts "inserindo andares..."
Floor.create(name: 'Térreo', description: 'Andar térreo do bloco')
Floor.create(name: '1º Andar', description: '1º Andar do departamento')
Floor.create(name: '2º Andar', description: '2º Andar do departamento')

puts "inserindo grupos de usuários..."
UserGroup.create(name: 'Diretor', description: 'Possui todos os privilégios')
UserGroup.create(name: 'Chefe de segurança', description: 'Possui todos os privilégios no seu dapartamento')
UserGroup.create(name: 'Chefe de limpeza', description: 'Possui todos os privilégios no seu dapartamento')
UserGroup.create(name: 'Chefe de TI', description: 'Possui todos os privilégios no seu dapartamento')
UserGroup.create(name: 'Técnico administrativo', description: 'Possui poucos privilégios')

puts "inserindo permissões..."
Permission.create(name: 'Público', description: 'todos os grupos de usuários tem permissão.')
Permission.create(name: 'Diretor e Segurança', description: '...')
Permission.create(name: 'Diretor e TI', description: '...')
Permission.create(name: 'Segurança e Limpeza', description: '...')

puts "pronto!"