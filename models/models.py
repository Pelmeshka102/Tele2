from mongoengine.document import Document, EmbeddedDocument
from mongoengine.fields import (
    BooleanField, 
    DictField,
    EmbeddedDocumentField,
    IntField,
    ListField,
    ReferenceField,
    StringField,
    URLField,
)


class Price(EmbeddedDocument):
    rubles = IntField(min_value=0, required=True)
    copeck = IntField(min_value=0, max_value=99, required=True)
        

class Sms(Document):
    amount = IntField(min_value=0)
    price = ReferenceField(Price)
    added = BooleanField(default=False)


class SocialNetwork(Document):
    name = StringField(required=True)
    url = URLField(required=True)
    price = EmbeddedDocumentField(Price, required=True)
    description = StringField()


class Tariff(Document):
    name = StringField(required=True)
    minuts = IntField(min_value=0, max_value=1000)
    trafic = IntField(min_value=0, max_value=40)
    socials_in = ListField(ReferenceField(SocialNetwork))
    description = StringField()
    price = EmbeddedDocumentField(Price)
    city_numbers_allowed = BooleanField(default=False)
    sms = ListField(ReferenceField(Sms))


class AdditionalService(Document):
    name = StringField()
    url = URLField()
    description = StringField()
    price = EmbeddedDocumentField(Price)


class Names(EmbeddedDocument):
    first_name = StringField()
    last_name = StringField()
    middle_name = StringField()


class User(Document):
    phone_number = StringField(
        regex=r"^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$",
        min_length=10,
        max_length=16,
        required=True,
        unique=True
    )
    name = EmbeddedDocumentField(Names, required=True)
    connected_tariff = ReferenceField(Tariff, required=True)
    additionals = DictField()

    def new_price(self, *args, **kwargs) -> None:
        """Some function, that calculate new price depends on additionals or special offers
        """
        ...


class Groups(Document):
    name = StringField()
    users_in = ListField(ReferenceField(User))

    def new_price(self, *args, **kwargs) -> None:
        """Some function, that calculate new price depends on additionals or special offers
        """
        ...
