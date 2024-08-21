for i in range(10):
  values = ",\n".join([
   f'("Angel Cruz", "angel{j}@gamil.com", "12345")'
    for j in range(10000 * i, 10000 * (i + 1))
])


print (f"INSERT INTO users(name, email, password) VALUES {values};")
