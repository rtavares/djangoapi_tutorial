from django.db import models
import uuid
from django.contrib.auth.models import User

# Create your models here.

def generate_ticket_id():
    # Generate a unique ticket id.
    return str(uuid.uuid4()).split('-')[-1]


class Ticket(models.Model):
    ticket_id = models.CharField(max_length=255, blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=255)
    content = models.TextField()
    category = models.ForeignKey("Category", on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now=True)
    modified = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.title}-{self.ticket_id}"

    def save(self, *args, **kwargs):
        if len(self.ticket_id.strip(" "))==0:
            self.ticket_id = generate_ticket_id()

        #  Call the parent save() method.
        super(Ticket, self).save(*args, **kwargs)

    class Meta:
        ordering = ["-created"]


class Category(models.Model):
    name = models.CharField(max_length=200)
    slug = models.SlugField()

    def __str__(self):
        return self.name
