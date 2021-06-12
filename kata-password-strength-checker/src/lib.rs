pub mod checker;

#[cfg(test)]
mod tests {

    use super::*;
    use crate::checker::Valid;

    #[test]
    fn empty_password_is_not_valid() {
        let _our_password = checker::Password {
            password:  "".to_string(),
            is_admin: false
        };

        assert_eq!(false, _our_password.is_correct_length())
    }

    #[test]
    fn password_with_length_less_than_seven_but_greater_than_zero() {
        let _our_password = checker::Password {
            password:  "12345".to_string(),
            is_admin: false
        };

        assert_eq!(false, _our_password.is_correct_length())
    }

    #[test]
    fn password_with_length_of_seven() {
        let _our_password = checker::Password {
            password:  "1234567".to_string(),
            is_admin: false
        };

        assert_eq!(true, _our_password.is_correct_length())
    }

    #[test]
    fn password_with_no_letter() {
        let _our_password = checker::Password {
            password:  "1234567".to_string(),
            is_admin: false
        };

        assert_eq!(false, _our_password.contains_letter())
    }


    #[test]
    fn password_with_a_letter() {
        let _our_password = checker::Password {
            password:  "123t4567".to_string(),
            is_admin: false
        };

        assert_eq!(true, _our_password.contains_letter())
    }

    #[test]
    fn password_with_no_digit() {
        let _our_password = checker::Password {
            password:  "abcdeds".to_string(),
            is_admin: false
        };

        assert_eq!(false, _our_password.contains_digit())
    }

    #[test]
    fn password_with_a_digit() {
        let _our_password = checker::Password {
            password:  "abc3eds".to_string(),
            is_admin: false
        };

        assert_eq!(true, _our_password.contains_digit())
    }

    #[test]
    fn password_with_a_digit_and_letter_but_less_than_seven_characters() {
        let _our_password = checker::Password {
            password:  "abc3dr".to_string(),
            is_admin: false
        };

        assert_eq!(false, _our_password.is_valid());
    }

    #[test]
    fn password_with_a_digit_and_letter_with_seven_characters() {
        let _our_password = checker::Password {
            password:  "abc3dr4".to_string(),
            is_admin: false
        };

        assert_eq!(true, _our_password.is_valid());
    }

    #[test]
    fn password_with_no_digit_and_letter_with_seven_characters() {
        let _our_password = checker::Password {
            password:  "abcsdre".to_string(),
            is_admin: false
        };

        assert_eq!(false, _our_password.is_valid());
    }

    #[test]
    fn admin_password_with_length_less_than_ten() {
        let _our_password = checker::Password {
            password:  "abc3dr4".to_string(),
            is_admin: true
        };

        assert_eq!(false, _our_password.is_admin_valid());
    }

    #[test]
    fn admin_password_with_length_of_ten() {
        let _our_password = checker::Password {
            password:  "1234567892".to_string(),
            is_admin: true
        };

        assert_eq!(true, _our_password.is_correct_length());
    } 
  
    #[test]
    fn admin_password_with_no_special_character() {
        let _our_password = checker::Password {
            password:  "1234567892".to_string(),
            is_admin: true
        };

        assert_eq!(false, _our_password.contains_special_character());
    }

    #[test]
    fn admin_password_with_a_special_character_and_of_length_atleast_ten() {
        let _our_password = checker::Password {
            password:  "12345678922$#3".to_string(),
            is_admin: true
        };

        assert_eq!(false, _our_password.is_admin_valid());
    }


    #[test]
    fn admin_password_that_is_valid() {
        let _our_password = checker::Password {
            password:  "1234e6c78922$#3".to_string(),
            is_admin: true
        };

        assert_eq!(true, _our_password.is_admin_valid());
    }
}
