package com.insurance.commission;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class CommissionService {
    private final List<PolicyRecord> records = new ArrayList<>();

    public CommissionService() {
        // Sample MVP baseline data
        records.add(new PolicyRecord("POL-101", "Agent Smith", 1200.00));
        records.add(new PolicyRecord("POL-102", "Agent Johnson", 2500.00));
    }

    // CREATE
    public void addRecord(PolicyRecord record) {
        records.add(record);
    }

    // VIEW ALL
    public List<PolicyRecord> getAllRecords() {
        return records;
    }

    // SEARCH BY ID
    public Optional<PolicyRecord> searchByPolicyId(String policyId) {
        return records.stream()
                .filter(r -> r.getPolicyId().equalsIgnoreCase(policyId))
                .findFirst();
    }

    // ROLE-BASED STATUS WORKFLOW UPDATE
    public boolean updateStatus(String policyId, String newStatus) {
        Optional<PolicyRecord> match = searchByPolicyId(policyId);
        if (match.isPresent()) {
            match.get().setStatus(newStatus);
            return true;
        }
        return false;
    }

    // SUMMARY DASHBOARD METRICS
    public double getTotalApprovedPayouts() {
        return records.stream()
                .filter(r -> "APPROVED".equalsIgnoreCase(r.getStatus()))
                .mapToDouble(r -> r.getPremiumAmount() * 0.10) // 10% commission rate
                .sum();
    }
}