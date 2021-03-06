/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 ******************************************************************************
*/

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.thirdparty.common;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.energyos.espi.thirdparty.common.Subscription;
import org.energyos.espi.thirdparty.common.SubscriptionDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect SubscriptionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SubscriptionDataOnDemand: @Component;
    
    private Random SubscriptionDataOnDemand.rnd = new SecureRandom();
    
    private List<Subscription> SubscriptionDataOnDemand.data;
    
    public Subscription SubscriptionDataOnDemand.getNewTransientSubscription(int index) {
        Subscription obj = new Subscription();
        setDescription(obj, index);
        setSubscriptionParameters(obj, index);
        setUuid(obj, index);
        return obj;
    }
    
    public void SubscriptionDataOnDemand.setDescription(Subscription obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void SubscriptionDataOnDemand.setSubscriptionParameters(Subscription obj, int index) {
        String subscriptionParameters = "subscriptionParameters_" + index;
        obj.setSubscriptionParameters(subscriptionParameters);
    }
    
    public void SubscriptionDataOnDemand.setUuid(Subscription obj, int index) {
        String uuid = "uuid_" + index;
        obj.setUuid(uuid);
    }
    
    public Subscription SubscriptionDataOnDemand.getSpecificSubscription(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Subscription obj = data.get(index);
        Long id = obj.getId();
        return Subscription.findSubscription(id);
    }
    
    public Subscription SubscriptionDataOnDemand.getRandomSubscription() {
        init();
        Subscription obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Subscription.findSubscription(id);
    }
    
    public boolean SubscriptionDataOnDemand.modifySubscription(Subscription obj) {
        return false;
    }
    
    public void SubscriptionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Subscription.findSubscriptionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Subscription' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Subscription>();
        for (int i = 0; i < 10; i++) {
            Subscription obj = getNewTransientSubscription(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
