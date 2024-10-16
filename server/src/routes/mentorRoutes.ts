import express from "express";
export const mentorRouter = express.Router();

import {
    insertManyMentors
} from "../controllers/mentor_controller.js";
import {
    deleteAll
} from "../controllers/reset_mentor_controller.js";

mentorRouter.post('/deleteAllMentors', deleteAll);
mentorRouter.post('/insertMentors', insertManyMentors);