/*
 * Copyright (C) 2012 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef DEVICE_PERMS_H
#define DEVICE_PERMS_H

#define PROPERTY_PERMS_APPEND \
    { "camera.",          AID_MEDIA,    0 },
    
#define CONTROL_PERMS_APPEND \
    { "media.cacao", AID_MEDIA, AID_MEDIA },

#endif /* DEVICE_PERMS_H */

