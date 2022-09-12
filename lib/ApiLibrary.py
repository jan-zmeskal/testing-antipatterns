from time import sleep
from random import choice, random


class ApiLibrary:
    ROBOT_LIBRARY_SCOPE = "TEST"

    @staticmethod
    def start_api_in_mode(mode):
        ...

    @staticmethod
    def check_that_api_has_started():
        ...

    @staticmethod
    def get_response_from_endpoint(endpoint):
        if endpoint == "/api/data/dump" and not choice([True, False]):
            raise RuntimeError("Storage unavailabe!")
        match endpoint:
            case "/api/data/dump":
                return "dump"
            case "/api/db/healthcheck":
                return "ready"
            case "/api/mq/healthcheck":
                return "ready"
            case "/api/engine/healthcheck":
                return "OK"
            case "/api/db/license":
                return "This component is licensed using MIT license"
            case "/api/mq/license":
                return "This component is licensed using GPL license"
            case "/api/engine/license":
                return "This component is licensed using MIT license"

    @staticmethod
    def check_correct_format(data):
        assert isinstance(data, str)

    @staticmethod
    def start_api_and_check_it_is_up(mode):
        sleep(random())

    @staticmethod
    def parse_status_from_response(response):
        return response

    @staticmethod
    def check_that_status_is_a_single_word(status):
        ...

    @staticmethod
    def post_payload_to_endpoint(endpoinnt, payload):
        ...

    @staticmethod
    def fetch_all_emails_from_inbox(address, password):
        sleep(random())

    @staticmethod
    def get_the_first_email(emails):
        ...

    @staticmethod
    def check_registration_mail_content(email):
        ...

    @staticmethod
    def configure_smtp_sender(from_header, redirect_to=None):
        ...

    @staticmethod
    def delete_all_emails_in_inbox(address, password):
        ...

    @staticmethod
    def delete_file(path):
        ...

    @staticmethod
    def load_emails_from_file(path):
        ...
