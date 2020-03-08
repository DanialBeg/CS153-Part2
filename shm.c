#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

struct {
  struct spinlock lock;
  struct shm_page {
    uint id;
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

int shm_open(int id, char **pointer) {

//you write this
//int first_proc = 1;
//struct proc *curproc = myproc();

acquire(&(shm_table.lock)); //mutual exclusion

int first_proc = 1;
struct proc *curproc = myproc();

 //CASE 1: Check the smh_table to see if the id that is trying to be opened already existed
for(unsigned int i = 0; i < 64; i++){
	if(shm_table.shm_pages[i].id == id){
		shm_table.shm_pages[i].refcnt++;
		mappages(curproc->pgdir, (void *)PGROUNDUP(curproc->sz), PGSIZE, V2P(shm_table.shm_pages[i].frame), PTE_W|PTE_U);
		//shm_table.shm_pages[i].refcnt++;
		*pointer = (char *)PGROUNDUP(curproc->sz);
		curproc->sz = PGROUNDUP(curproc->sz) + PGSIZE;
		first_proc = 0;
	}
}
//END CASE1

//CASE 2: If the id is not on the shm_table we will make our id the first to do so
if(first_proc == 1){
	unsigned int i;
	for(i = 0; i < 64; i++){
		if(shm_table.shm_pages[i].id == 0 && shm_table.shm_pages[i].frame == 0 && shm_table.shm_pages[i].refcnt == 0){
			//break;
			shm_table.shm_pages[i].id = id; // The new id is this
			char* memory = kalloc();
			memset(memory, 0, PGSIZE);
			shm_table.shm_pages[i].frame = memory; 
			shm_table.shm_pages[i].refcnt += 1; // Only one item is connected here
			mappages(curproc->pgdir, (void *)PGROUNDUP(curproc->sz), PGSIZE, V2P(shm_table.shm_pages[i].frame), PTE_W|PTE_U);
			*pointer = (char *)PGROUNDUP(curproc->sz);
			curproc->sz = PGROUNDUP(curproc->sz) + PGSIZE;		
			break;
		}
	}
}


release(&(shm_table.lock)); // mutual exclusion ending




return 0; //added to remove compiler warning -- you should decide what to return
}


int shm_close(int id) {
//you write this too!

   acquire(&(shm_table.lock));
  
   for(unsigned int i = 0; i < 64; i++){
      if(shm_table.shm_pages[i].id == id){
	 if(shm_table.shm_pages[i].refcnt >= 1){
	    shm_table.shm_pages[i].refcnt -= 1;
	 }
      }
      else{
	 shm_table.shm_pages[i].id = 0;
	 shm_table.shm_pages[i].frame = 0;
	 shm_table.shm_pages[i].refcnt = 0;
      }
   }
   release(&(shm_table.lock));
   
   return 0; //added to remove compiler warning -- you should decide what to return
}
