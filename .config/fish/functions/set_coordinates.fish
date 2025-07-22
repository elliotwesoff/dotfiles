function set_coordinates
    if test (timedatectl show --property=Timezone) = "Timezone=Europe/Berlin"
        # munich
        set -gx LOC_LAT 48.14803580815556
        set -gx LOC_LONG 11.588875333597782
    else
        # surf beach
        set -gx LOC_LAT 34.6831139
        set -gx LOC_LONG -120.6232676
    end
end
