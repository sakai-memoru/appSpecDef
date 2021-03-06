from django.db import models
class Job(models.Model):
    # id = # models.AutoField()
    seq_id = models.DecimalField( unique=True)
    job_name = models.CharField( max_length= 2000)
    contents = models.TextField( null=True)
    sites = models.CharField( max_length= 2000, null=True)
    durings = models.CharField( max_length= 2000, null=True)
    price = models.DecimalField( max_length= 9,2, null=True)
    industry = models.CharField( max_length= 2000, null=True)
    skill_required = models.CharField( max_length= 2000, null=True)
    skill_recommended = models.CharField( max_length= 2000, null=True)
    environment = models.CharField( max_length= 2000, null=True)
    age = models.CharField( max_length= 2000, null=True)
    can_accept_foreigner = models.CharField( max_length= 2000, null=True)
    required_numbers = models.CharField( max_length= 2000, null=True)
    counts_for_interview = models.CharField( max_length= 2000, null=True)
    working_time = models.CharField( max_length= 2000, null=True)
    average_work_hours = models.CharField( max_length= 2000, null=True)
    organization = models.CharField( max_length= 2000, null=True)
    commercial_flow = models.CharField( max_length= 2000, null=True)
    payment_site = models.CharField( max_length= 2000, null=True)
    settlement_to_overhours = models.CharField( max_length= 2000, null=True)
    note = models.TextField( null=True)
    file_name = models.CharField( max_length= 2000)
    del_flag = models.CharField( max_length= 6, null=True)
    created_date = models.DateTimeField()
    created_user_id = models.CharField( max_length= 20)
    updated_date = models.DateTimeField( null=True)
    updated_user_id = models.CharField( max_length= 20, null=True)
    deleted_date = models.DateTimeField( null=True)
    deleteed_user_id = models.CharField( max_length= 20, null=True)
