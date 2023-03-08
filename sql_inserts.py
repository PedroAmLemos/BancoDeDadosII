publishers = [
    "squash",
    "reverse",
    "suppress",
    "appear",
    "fibre",
    "rare",
    "indoor",
    "accident",
    "glide",
    "rest",
    "mill",
    "injury",
    "hover",
    "bitch",
    "apology",
    "army",
    "family",
    "skilled",
    "tent",
    "gesture",
    "belief",
    "thought",
    "worth",
    "hunting",
    "install",
    "rocket",
    "false",
    "bracket",
    "demonstration",
    "dine",
    "loose",
    "initiative",
    "calculation",
    "content",
    "vacuum",
    "carbon",
    "concession",
    "stun",
    "wedding",
    "ballot",
    "perforate",
    "roof",
    "vessel",
    "dash",
    "mix",
    "pain",
    "star"
]

authors = [
    "Jackie Manning",
    "Edmund Nicholson",
    "Valarie Perkins",
    "Terrell Jacobson",
    "Daren Avery",
    "Josef Carpenter",
    "Jess Richard",
    "Aubrey Cochran",
    "Al Davila",
    "Susan Gilbert",
    "Ray Meyers",
    "Leonard Weaver",
    "Ernestine Silva",
    "Ida Andrade",
    "Rory Mckenzie",
    "Laverne Oconnor",
    "Ashlee Weeks",
    "Lillian Randall",
    "Kim Kirby",
    "Gonzalo Peterson",
    "Kristofer Lam",
]

borrowers = [
    "Theresa Gardner",
    "Michael Reynolds",
    "Harold Gray",
    "April Hanson",
    "Joshua Jones",
    "Emily Nguyen",
    "Charles Joyce",
    "Michael Moreno",
    "Erik Long",
    "Susan Colon",
]

print('-- Inserindo as publishers e um livro para cada publisher (palavras aleatorias)\n\n')
for i, publisher in enumerate(publishers):
    print(f"INSERT INTO library.publisher (Name, Address, Phone)\n"
          f"VALUES ('{publisher}','Endereço da {publisher}','43 3333 3333');")
    print(f"INSERT INTO library.book (Book_id, Title, Publisher_name)\nVALUES ({i+1},'Livro {i + 1}','{publisher}');")

print('\n\n-- Inserindo os autores (nomes aleatórios)\n\n')
for i, author in enumerate(authors):
    print(f"INSERT INTO library.book_authors (Book_id, Author_name)\nVALUES ({i + 1}, '{author}');")

print('\n\n-- Inserindo as branches\n\n')
for i in range(1, 5):
    print(f"INSERT INTO library.library_branch (Branch_id, Branch_name, Address)\n"
          f"VALUES ({i},'Regiao {i}','Rua Aleatória {i}');")

print('\n\n-- Inserindo as copias dos livros\n\n')
for i in range(0, 40):
    num = i % 4 + 1
    print(f"INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)\n"
          f"VALUES ({i+1}, {num}, 3);")

print('\n\n-- Inserindo os membros\n\n')
for i, borrower in enumerate(borrowers):
    print(f"INSERT INTO library.borrower (Card_no, Name, Address, Phone)\n"
          f"VALUES ({i+1},'{borrower}','endereço', 'telefone');")

