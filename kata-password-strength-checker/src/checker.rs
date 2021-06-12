
pub struct Password {
    pub password: String,
    pub is_admin: bool
}

pub trait Valid {
    fn is_valid(&self) -> bool;
    fn is_admin_valid(&self) -> bool;
    fn is_correct_length(&self) -> bool;
    fn contains_letter(&self) -> bool;
    fn contains_digit(&self) -> bool;
    fn contains_special_character(&self) -> bool;
}

const MAX_LENGTH_FOR_PASSWORD: usize = 7;
const MAX_LENGTH_FOR_ADMIN_PASSWORD: usize = 10;

impl Valid for Password {
   fn is_valid(&self) -> bool {
        self.is_correct_length() &&
        self.contains_digit() &&
        self.contains_letter()
   } 

   fn is_admin_valid(&self) -> bool {
        self.is_valid() &&
        self.contains_special_character()
   }

   fn is_correct_length(&self) -> bool {
        if self.is_admin {
            return self.password.len() >= MAX_LENGTH_FOR_ADMIN_PASSWORD
        }
        self.password.len() >= MAX_LENGTH_FOR_PASSWORD
   }

   fn contains_letter(&self) -> bool {
       self.password.chars().any(char::is_alphabetic)
   }
   
   fn contains_digit(&self) -> bool {
       self.password.chars().any(char::is_numeric)
   }

   fn contains_special_character(&self) -> bool {
       !self.password.chars().all(char::is_alphanumeric)
   }
}