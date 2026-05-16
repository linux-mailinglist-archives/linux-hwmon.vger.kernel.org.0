Return-Path: <linux-hwmon+bounces-14195-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHXXFgCJCGrEuAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14195-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 17:10:56 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA7555C42A
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 17:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E35D6300D957
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 15:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBAE340A47;
	Sat, 16 May 2026 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X33vxEgC"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDDA33B6C2
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778944252; cv=none; b=i6uG95YSqrGn30MHJWPvOvfk314YX1pfwxJ5Is4bmsinW8eex/RMnUWNeqbYJg632BBuF45NA4DpsymZR0SM3he6ZGCOPCNeuLsg8kZwcfBM6xKM0I+/pxio0GviDn4PoKqs6uVtC4R9KUjixLNRlovSlFSZT9CNFxTUFTvyMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778944252; c=relaxed/simple;
	bh=J/Jydc8Eo0c4qpZ45vh01yAS2K5Yrlc36sNQ6+8c8dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnSLqb8F5nIpZux1zV2KzCcqziSKuG5R4xADQgnZyLK2Exqo1tmST27N0kx+shJ8CNTUjwCMgIRrUObjeKsHd5a3l/jxCZzPx/aswPVQcNON0QpCIWHI7GFpe8x6dEnj0f8Xld7Bx4aQXXG7dRqS6GMzb7Ipepip48mHMx1wPm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X33vxEgC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44e5624c053so373818f8f.2
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778944249; x=1779549049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gw2QmgbIl5pvovKMZQSLFaSD9mAGtLLct8D1JeMaEAw=;
        b=X33vxEgCEiJ4hDpxAnMfi9qLTQqG67CGPxutzPxZ7OprrptVmFShkZAxLAvqaRYMnV
         mnge6M2tw3ErARwYC6DdNfUYubTyPCjwNhQbH1A16ihdwNs1sDy4Hbk9cVe7Z0z9iDAf
         spYkcnlAvFIGifN9Ig5SUoTCkQR8QBXLKBAr4AQouHODZXVOkDrTOKokiDB0vCOtAIBf
         KEvpZq4V6ixsOtkTeYWgFGCzmgPnypgj6EGtisPxF7Neq25JeaTaUDf1ibmVDw72J+jK
         G6QtRvY4FqueIXpQqYYlfUBRCD+KXMYHKM83E3mb573heNPvZdiuPp9zk1JkN4HwWH32
         6jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778944249; x=1779549049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gw2QmgbIl5pvovKMZQSLFaSD9mAGtLLct8D1JeMaEAw=;
        b=CX6ZbYUTDdVm7SjmtSw4DsbDb+1kplRu+1USfux5XqkvtV/8b1aM65Ia3L6+Dhwm3D
         w5u++UFSPguzCNFb4k5hVgQZJMFzTQk8ok/j82Z8po4tBrpcaXkbJWG+4Qg5mHvAY27A
         OwZj3sX4/uK+2ZkaTr+ihE9b3myJaUJDmifXEdp52wp/ME+mkD6SnRmaLjD93MZaifIK
         ESCXdllO/dqPU5h9OsXV7ub41ygXVla8r+uFtFW1maJQt0QDeCl9iDipJzjVLFKhY1zX
         xfE6g9yuE2gqo/G3FiMT86o6ull6ezrtLHVJ4tdxtRZnkKpyLVDqire3dD/v6FoUzRyr
         qsPQ==
X-Gm-Message-State: AOJu0YxkDjNdCKQE2Q6x9YVd7oOWobi8ieD3UL0bdaR+C4/HQ0H2CvxC
	XBQ8qPuUt4JbxWvUflij3QZuVZKVg1SNMJSekmpI7GGDXgf7hUmFAFNqlJIo9T8b
X-Gm-Gg: Acq92OFG2db+ylGe88uAxUFfMboFP0GvCyRXwSyWvWeygKLkQkEwa/e/oyOzM0AbiEd
	Bgx1CX13rXqmMeBn9xbcJQI77JDN0joFDA26Mv9rIpjE2t1fXG/RugyvsrYzehTtZBNzeB164L7
	vXpL2CIxAiqkO+PsxH4830GaFF37G7ERh7Dq05rZupTx+Ptsb6LDotO3ayqQPYiC69fqoc+mJGS
	eeA2ZKjwtgsuyM5rggb24B1fz44MbUnxoboNYHWXAcO4SBvzq1sr8uCmIg9MX0cHv1WX3nwksPG
	AQNcEWzt+KhQQv4Qyww0B6+5uxwpzLnO199/cI9Ynh6J+q0fsfby9Bff2ootUXRsv6zWd87cpx7
	MxGa9u71C19DTqUOUw5GxTJ6+N1Hh8JNYiGF4X/scMEN+XcLxJdoLrwjB//jWIgOXjBe4sCdhUo
	aSfolIrGJS84qHHMGTXeVV+8i/+kHTmwClNfzSTQBsX8VdgIKG55quUEIRCqQxvpVvihxTjb3nM
	n8=
X-Received: by 2002:a05:6000:228a:b0:44a:b0a3:7c1a with SMTP id ffacd0b85a97d-45e5c5cf9e1mr11879052f8f.24.1778944246700;
        Sat, 16 May 2026 08:10:46 -0700 (PDT)
Received: from arch (mm-28-201-122-178.mgts.dynamic.pppoe.byfly.by. [178.122.201.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm21526572f8f.11.2026.05.16.08.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:10:46 -0700 (PDT)
From: bakshansky.lists@gmail.com
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net
Subject: Re: [PATCH 2/2] hwmon: (coretemp) fix coding style issues
Date: Sat, 16 May 2026 18:10:44 +0300
Message-ID: <20260516151044.1544-1-bakshansky.lists@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6d062c67-5741-4a55-a741-00a5d810747c@roeck-us.net>
References: <6d062c67-5741-4a55-a741-00a5d810747c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ADA7555C42A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14195-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bakshanskylists@gmail.com,linux-hwmon@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> Oh never mind, I'll fix that up and apply the patch.
> 
> Guenter

Thank you for fixing that and for taking the patches, Guenter. This was my
first contribution to the kernel, and your review made it a great experience.
I appreciate it.

Roman

