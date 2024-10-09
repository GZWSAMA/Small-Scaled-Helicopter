function quat = vectorToQuaternion(v)
    % Normalize the velocity vector to get the direction.
    norm_v = norm(v);

    if norm_v == 0
        error('Velocity vector cannot be zero.');
    end

    % Normalize the vector
    unit_v = v / norm_v;

    % Find the rotation axis which is perpendicular to both reference axis and the vector.
    ref_axis = [0; 0; 1]; % Reference axis: Z-axis
    cross_product = cross(ref_axis, unit_v);

    % Compute the cosine of half the angle between the two vectors.
    cos_half_theta = dot(ref_axis, unit_v);

    % Compute the sine of half the angle.
    sin_half_theta = norm(cross_product);

    % Normalize the cross product to get the rotation axis.
    if sin_half_theta > eps
        axis = cross_product / sin_half_theta;
    else
        axis = [0; 0; 1]; % In case the vectors are parallel or anti-parallel.
        cos_half_theta = 1;
        sin_half_theta = 0;
    end

    % Construct the quaternion [w, x, y, z]
    w = cos_half_theta;
    xyz = sin_half_theta * axis;
    quat = [w; xyz];

    % Ensure the quaternion is normalized.
    quat = quat / norm(quat);
end