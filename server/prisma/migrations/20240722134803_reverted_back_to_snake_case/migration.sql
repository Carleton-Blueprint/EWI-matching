-- CreateTable
CREATE TABLE "Course" (
    "id" SERIAL NOT NULL,
    "course_code" TEXT NOT NULL,
    "course_name" TEXT NOT NULL,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Mentor" (
    "id" SERIAL NOT NULL,
    "mentor_id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "email_address" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    "Program" TEXT NOT NULL,

    CONSTRAINT "Mentor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Availability" (
    "id" SERIAL NOT NULL,
    "start_tme" TIMESTAMP(3) NOT NULL,
    "end_time" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Availability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Student" (
    "id" SERIAL NOT NULL,
    "entity_number" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "major" TEXT NOT NULL,
    "preferred_name" TEXT NOT NULL,
    "preferred_pronouns" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "year_level" TEXT NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MentorAvailability" (
    "availability_id" INTEGER NOT NULL,
    "mentor_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "StudentAvailability" (
    "availability_id" INTEGER NOT NULL,
    "student_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "MentorCourse" (
    "mentor_id" INTEGER NOT NULL,
    "course_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "StudentCourse" (
    "student_id" INTEGER NOT NULL,
    "course_id" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Course_course_code_key" ON "Course"("course_code");

-- CreateIndex
CREATE UNIQUE INDEX "Mentor_mentor_id_key" ON "Mentor"("mentor_id");

-- CreateIndex
CREATE UNIQUE INDEX "Student_entity_number_key" ON "Student"("entity_number");

-- CreateIndex
CREATE UNIQUE INDEX "MentorAvailability_availability_id_mentor_id_key" ON "MentorAvailability"("availability_id", "mentor_id");

-- CreateIndex
CREATE UNIQUE INDEX "StudentAvailability_availability_id_student_id_key" ON "StudentAvailability"("availability_id", "student_id");

-- CreateIndex
CREATE UNIQUE INDEX "MentorCourse_mentor_id_course_id_key" ON "MentorCourse"("mentor_id", "course_id");

-- CreateIndex
CREATE UNIQUE INDEX "StudentCourse_student_id_course_id_key" ON "StudentCourse"("student_id", "course_id");

-- AddForeignKey
ALTER TABLE "MentorAvailability" ADD CONSTRAINT "MentorAvailability_availability_id_fkey" FOREIGN KEY ("availability_id") REFERENCES "Availability"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MentorAvailability" ADD CONSTRAINT "MentorAvailability_mentor_id_fkey" FOREIGN KEY ("mentor_id") REFERENCES "Mentor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentAvailability" ADD CONSTRAINT "StudentAvailability_availability_id_fkey" FOREIGN KEY ("availability_id") REFERENCES "Availability"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentAvailability" ADD CONSTRAINT "StudentAvailability_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MentorCourse" ADD CONSTRAINT "MentorCourse_mentor_id_fkey" FOREIGN KEY ("mentor_id") REFERENCES "Mentor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MentorCourse" ADD CONSTRAINT "MentorCourse_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "Course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentCourse" ADD CONSTRAINT "StudentCourse_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentCourse" ADD CONSTRAINT "StudentCourse_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "Course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
