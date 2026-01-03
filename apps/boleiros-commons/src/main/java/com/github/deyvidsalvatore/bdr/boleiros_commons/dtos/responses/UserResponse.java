package com.github.deyvidsalvatore.bdr.boleiros_commons.dtos.responses;

import java.util.Date;

public record UserResponse(
        String fullName,
        String email,
        String educationLevel,
        String profilePictureUrl,
        boolean active,
        Date createdAt,
        Date updatedAt
) {
}
