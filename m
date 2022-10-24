Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6833460BE98
	for <lists+linux-hwmon@lfdr.de>; Tue, 25 Oct 2022 01:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbiJXXbl (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 24 Oct 2022 19:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbiJXXbO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Oct 2022 19:31:14 -0400
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259787AC0E
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Oct 2022 14:52:14 -0700 (PDT)
Received: from rico.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D37EA2001E;
        Mon, 24 Oct 2022 20:51:07 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1666615869;
        bh=S/YqY0MKbB+AnFECwyRbAC+AXdrjgo7/39FIRTIQRgw=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=mPOwbN7xYmW30Ov8Q9roP+WiTpDaTbxtKtCZamOwiRP/4sxnLqB18iFoIa1X3imLn
         9PNEJIg5UqdNrZELcRsLFVShK3vENrPyoT0gwE6oCrWeB231y2fU3HYmZCpfojFIZP
         QCW1Y8xxuNJ5ghrYzDWUvZ/vtQiy5szi4DsKFt8rc4O8annqN3VpFtcPY3FD8WO1f0
         e53uyKO21k3fIkqrQyMYT7hgw8IHmB3rPhK+eKezI5zBwuO4jULv2DwqvoEvNeOY0G
         LjYv/FQ9sC3GrtfAhQZEeadar3+L5VS3scn8rEZu182/ABamQGYqcn8hEanTVVsYzd
         N5bvbOmittsQw==
Message-ID: <525cad90e1e54c7dbf10822f4a755c27a808fc6f.camel@codeconstruct.com.au>
Subject: Re: [PATCH] hwmon/occ: OCC sensors aren't arch-specific
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>
Date:   Mon, 24 Oct 2022 20:51:07 +0800
In-Reply-To: <20221024113218.GA3800308@roeck-us.net>
References: <20221024081527.3842565-1-jk@codeconstruct.com.au>
         <20221024113218.GA3800308@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

> Should the original patch be reverted instead, and should the revert
> be backported ? In other words, is this a bug fix which needs to be
> applied to v6.1, or is it needed for v6.2+ only ?

This isn't a regression, we're just enabling this driver on a new
hardware implementation. No need to backport either.

I don't think that warrants a revert, as having a separate change means
we keep the rationale for both changes in the git history.

Cheers,


Jeremy
