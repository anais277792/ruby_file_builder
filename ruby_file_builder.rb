require 'pry'
#créationd d'un dossier qui porte le nom de l'argv
def create_folder(file_name)
    system("mkdir #{file_name}")
    system("cd #{file_name}")
end 

#vérification du nom 
def check_if_user_gave_input
    abort("erreur: nom_du_dossier") if ARGV.empty? || ARGV.length > 1  
end


 #Création du Gemfile avec les gems de THP
def build_gemfile(file_name)
    file = File.open("./#{file_name}/Gemfile", "a")
    file.puts("gem 'pry'\n gem 'rspec'\n gem 'rubocop'")
    file.close
end
#Git init
def init_git(file_name)
    Dir.chdir "./#{file_name}" do
        system 'git init'
      end
end
#créationd du fichier .env => gitignore
def other_file(file_name)
    file = File.open("./#{file_name}/.env", "a") #dotenv file
    file.puts(" ")
    file.close 

    file = File.open("./#{file_name}/.gitignore", "a") # gitignore file
    file.puts(".env")
    file.close 
end 
#création des dossier lib et spec et du fichier README.md
def lib_spec_readme(file_name)
    Dir.mkdir("./#{file_name}/lib")
    Dir.chdir "./#{file_name}" do
    system 'rspec --init'
  end
    file = File.open("./#{file_name}/README.md", "a")
    file.puts("# Project name\n***\n#Short Description about the project.")
end
def perform 
    file_name = ARGV.join
    check_if_user_gave_input
    create_folder(file_name)
    build_gemfile(file_name)
    init_git(file_name)
    other_file(file_name)
    lib_spec_readme(file_name)
end
perform
