defmodule HighSchoolSweetheart do
  def first_letter(name) do
  
   name |>String.trim()|>String.at(0)
    
  end

  def initial(name) do   
    first_letter(name)|>String.capitalize() |> Kernel.<>"."
  end

  def initials(full_name) do
      sentence = String.split(full_name)
      name = initial(Enum.at(sentence,0))
      surname = initial(Enum.at(sentence,1))
      name <> " " <> surname
  end

  def pair(full_name1, full_name2) do

     name1=initials(full_name1)
     name2=initials(full_name2)

   """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{name1}  +  #{name2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """ 
  end
end
