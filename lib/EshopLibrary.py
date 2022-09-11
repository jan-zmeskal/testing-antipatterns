from os import stat


class EshopLibrary:
    ROBOT_LIBRARY_SCOPE = "SUITE"
    user_created = False
    cart_items = 0

    @staticmethod
    def go_to_user_registration_page():
        ...

    @staticmethod
    def fill_in_user_credentials(username, password):
        ...

    @staticmethod
    def generate_card_number():
        ...

    @staticmethod
    def fill_in_card_number(number):
        ...

    def submit_registration(self):
        self.user_created = True

    @staticmethod
    def wait_until_registration_succeeds(timeout):
        ...

    @staticmethod
    def go_to_delete_account_page():
        ...

    def submit_account_deletion(self, confirm):
        if not self.user_created:
            raise RuntimeError("No user with such name exists!")

    @staticmethod
    def wait_until_account_deletion_succeeds(timeout):
        ...

    def delete_user_via_db(self, username):
        self.user_created = False

    def create_user_via_db(self, *args, **kwargs):
        self.user_created = True

    def add_to_cart(self, item, quantity):
        self.cart_items += int(quantity)

    def get_number_of_items_in_cart(self):
        return self.cart_items

    def clear_shopping_cart(self):
        self.cart_items = 0

    @staticmethod
    def log_in_as_admin():
        ...

    @staticmethod
    def go_to_user_list():
        ...

    @staticmethod
    def open_user_edit_dialog(username):
        ...

    @staticmethod
    def change_user_properties(*args, **kwargs):
        ...

    @staticmethod
    def check_that_user_exists_in_list(username):
        ...

    @staticmethod
    def open_user_view_dialog(username):
        ...

    @staticmethod
    def get_user_property(property_name):
        match property_name:
            case "gender":
                return "male"
            case "age":
                return 16
