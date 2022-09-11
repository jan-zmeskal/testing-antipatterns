from os import stat


class EshopLibrary:
    ROBOT_LIBRARY_SCOPE = "SUITE"
    user_created = False

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

    def create_user_via_db(self, username, passowrd):
        self.user_created = True
