# serializers.py
from rest_framework import serializers
from .models import Borrower, LoanApplication, Loan

class BorrowerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Borrower
        fields = ['id', 'user', 'phone', 'nationalID']

class LoanApplicationSerializer(serializers.ModelSerializer):
    loan_name = serializers.CharField(source='loan.name')
    loan_principal = serializers.DecimalField(source='loan.principal', max_digits=10, decimal_places=2)
    loan_interest_rate = serializers.DecimalField(source='loan.interest_rate', max_digits=5, decimal_places=2)
    loan_term_days = serializers.IntegerField(source='loan.loan_term_days')
    loan_processing_fee = serializers.DecimalField(source='loan.processing_fee', max_digits=10, decimal_places=2)
    
    class Meta:
        model = LoanApplication
        fields = ['id', 'borrower', 'loan_name', 'loan_principal', 'loan_interest_rate', 'loan_term_days', 'loan_processing_fee', 'status', 'applied_at', 'repaid_amount', 'is_fully_repaid']

class LoanSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loan
        fields = ['id', 'name', 'principal', 'interest_rate', 'loan_term_days', 'processing_fee']
