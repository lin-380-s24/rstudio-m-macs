# This script will uninstall all swirl courses.
# It will then install the course lessons.
# This can be used to setup/ update the lessons.

# Uninstall all swirl courses
swirl::uninstall_all_courses(force = TRUE)

# Install the course
swirl::install_course_github("qtalr", "Lessons")
