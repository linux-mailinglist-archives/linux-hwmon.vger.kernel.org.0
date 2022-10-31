Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDBC46138A3
	for <lists+linux-hwmon@lfdr.de>; Mon, 31 Oct 2022 15:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiJaOEt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 31 Oct 2022 10:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbiJaOEs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 10:04:48 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1CEC010B47;
        Mon, 31 Oct 2022 07:04:48 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F9581FB;
        Mon, 31 Oct 2022 07:04:54 -0700 (PDT)
Received: from bogus (unknown [10.57.6.137])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B20653F5A1;
        Mon, 31 Oct 2022 07:04:46 -0700 (PDT)
Date:   Mon, 31 Oct 2022 14:04:17 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Cristian Marussi <cristian.marussi@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 7/8] hwmon: (scmi) Register explicitly with Thermal
 Framework
Message-ID: <20221031140417.sn6xeypj3624tjtu@bogus>
References: <7acc7a49-debb-abdb-f01c-f8adef4c1f0e@roeck-us.net>
 <20221031114018.59048-1-cristian.marussi@arm.com>
 <20221031132523.mfp7d5esk5hohldk@bogus>
 <20221031140021.GB948107@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031140021.GB948107@roeck-us.net>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 31, 2022 at 07:00:21AM -0700, Guenter Roeck wrote:
> On Mon, Oct 31, 2022 at 01:25:23PM +0000, Sudeep Holla wrote:
> > On Mon, Oct 31, 2022 at 11:40:18AM +0000, Cristian Marussi wrote:
> > > Available sensors are enumerated and reported by the SCMI platform server
> > > using a 16bit identification number; not all such sensors are of a type
> > > supported by hwmon subsystem and, among the supported ones, only a subset
> > > could be temperature sensors that have to be registered with the Thermal
> > > Framework.
> > > Potential clashes between hwmon channels indexes and the underlying real
> > > sensors IDs do not play well with the hwmon<-->thermal bridge automatic
> > > registration routines and could need a sensible number of fake dummy
> > > sensors to be made up in order to keep indexes and IDs in sync.
> > > 
> > > Avoid to use the hwmon<-->thermal bridge dropping the HWMON_C_REGISTER_TZ
> > > attribute and instead explicit register temperature sensors directly with
> > > the Thermal Framework.
> > >
> > 
> > Hi Guenter,
> > 
> > FWIW from scmi perspective,
> > 
> > Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> > 
> > I was about to ask for your ack to pickup myself but I see there is no
> > strict dependency for that. Not sure if you want to take this as fix for
> > v6.1 as the thermal changes broke the existing support in SCMI hwmon
> > or do you still prefer v6.2 ?
> > 
> 
> It is a regression and should be applied to 6.1. I'll pick it up and send
> a pull request to Linus later this week.

Indeed, thanks for the confirmation.

-- 
Regards,
Sudeep
