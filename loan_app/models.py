from django.contrib.auth.models import User
from django.db import models
from django.utils import timezone


class Loan(models.Model):
    name = models.CharField(max_length=100, unique=True)  # e.g., "Personal Loan", "Mortgage"
    principal = models.DecimalField(max_digits=10, decimal_places=2)  # The base amount of the loan
    interest_rate = models.DecimalField(max_digits=5, decimal_places=2)  # e.g., "5.5%" interest rate
    loan_term_days = models.IntegerField()  # Loan term in days (e.g., 30, 365)
    processing_fee = models.DecimalField(max_digits=10, decimal_places=2)  # Processing fee for the loan

    def __str__(self):
        return f"{self.name} - {self.principal} @ {self.interest_rate}%"

    def calculate_total_amount(self):
        """Calculate the total amount payable (principal + interest + fees)."""
        interest_amount = (self.principal * self.interest_rate) / 100
        return self.principal + interest_amount + self.processing_fee


class Borrower(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15, unique=True)
    nationalID = models.CharField(max_length=10, unique=True)

    def __str__(self):
        return f"{self.user.username} - Borrower"


class LoanApplication(models.Model):
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected'),
    ]
    
    borrower = models.ForeignKey(Borrower, on_delete=models.CASCADE)  # Linked to the borrower
    loan = models.ForeignKey(Loan, on_delete=models.CASCADE)  # Linked to the loan type
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='pending')
    applied_at = models.DateTimeField(auto_now_add=True)
    repaid_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    is_fully_repaid = models.BooleanField(default=False)

    def __str__(self):
        return f"Application {self.id} - {self.borrower.user.username} - {self.loan.name} - {self.status}"

    def calculate_due_date(self):
        """Calculates the due date based on loan term and the application approval date."""
        return self.applied_at + timezone.timedelta(days=self.loan.loan_term_days)

    def calculate_total_amount(self):
        """Calculates the total repayment amount for the specific application."""
        return self.loan.calculate_total_amount()
    
    def update_repayment_status(self):
        """Updates the repayment status based on how much has been repaid."""
        total_amount = self.calculate_total_amount()
        if self.repaid_amount >= total_amount:
            self.is_fully_repaid = True
        self.save()
