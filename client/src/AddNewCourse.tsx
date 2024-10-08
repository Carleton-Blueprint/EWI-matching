import { zodResolver } from "@hookform/resolvers/zod";
import axios from "axios";
import React from "react";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { Button } from "./components/ui/button";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "./components/ui/form";
import { Input } from "./components/ui/input";
import { courseFormSchema } from "./schemas/entityForm";
const serverUrl = process.env.REACT_APP_SERVER_URL || "http://localhost:5000";

export const AddNewCourse = () => {
  const form = useForm<z.infer<typeof courseFormSchema>>({
    resolver: zodResolver(courseFormSchema),
    defaultValues: {
      courseCode: "",
      courseName: "",
    },
  });

  const onSubmit = async (courses: any) => {
    try {
      console.log("courses", courses)
      await axios.post(`${serverUrl}/course/addCourse`, {
        data: {courses},
      });
      console.log("data sent successfully")
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)}>
        <FormField
          control={form.control}
          name="courseCode"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Course code</FormLabel>
              <FormControl>
                <Input
                  // onChange={handleCourseCodeChange}
                  placeholder="COMP1405"
                  {...field}
                />
              </FormControl>
              <FormDescription></FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="courseName"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Course name</FormLabel>
              <FormControl>
                <Input
                  // onChange={handleCourseNameChange}
                  placeholder="Introduction to Computer Science"
                  {...field}
                />
              </FormControl>
              <FormDescription></FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit">Submit</Button>
      </form>
    </Form>
  );
};
