package com.insurance.commission;

public class PolicyRecord {
    private String policyId;
    private String agentName;
    private double premiumAmount;
    private String status; // PENDING, APPROVED, PAID

    public PolicyRecord(String policyId, String agentName, double premiumAmount) {
        this.policyId = policyId;
        this.agentName = agentName;
        this.premiumAmount = premiumAmount;
        this.status = "PENDING";
    }

    // Getters and Setters
    public String getPolicyId() { return policyId; }
    public String getAgentName() { return agentName; }
    public double getPremiumAmount() { return premiumAmount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}